using System;
using Global;
using ScritpableObject;
using Unity.VisualScripting;
using UnityEngine;
using Util;
using VContainer;

namespace PlayerSetting
{
    public class PlayerMoment : MonoBehaviour
    {
        public float speed = 5f;
        [SerializeField]
        private VirtualJoystick.VirtualJoystick _virtualJoystick;
        private Animator _animator;
        
        Vector2 moveDir = Vector2.zero;
        private PlayerAnimatorHash _playerAnimatorHash;
        private bool _isGround = false;

        public float deadHight = -10f;

        private PlayerState _playerState = PlayerState.IDLE;
        public PlayerState playerState
        {
            get =>_playerState;
            private set
            {
                _playerState = value;
                switch (_playerState)
                {
                    case PlayerState.IDLE:
                        _animator.SetLayerWeight(1,1);
                        _animator.SetBool(_playerAnimatorHash.boolMove,false);
                        break;
                    case PlayerState.RUN:
                        _animator.SetLayerWeight(1,1);
                        _animator.SetBool(_playerAnimatorHash.boolMove,true);
                        break;
                    case PlayerState.DEAD:
                        _animator.SetLayerWeight(1,0);
                        _animator.SetTrigger(_playerAnimatorHash.triggerDeath);
                        break;
                    case PlayerState.FALL:
                        _animator.SetLayerWeight(1,0);
                        _animator.SetBool(_playerAnimatorHash.boolFall,true);
                        break;
                        default:
                            print("PlayerState Error");
                        break;
                }
            }
        }

        [Inject]
        EventOSContainer eventOsContainer;
        [Inject]
        GameManager gameManager;
        [Inject]
        SceneLoader sceneLoader;
        private void Awake()
        {
            _animator = GetComponent<Animator>();
            _playerAnimatorHash = new PlayerAnimatorHash();
            _playerAnimatorHash.boolMove = Animator.StringToHash("move");
            _playerAnimatorHash.boolFall = Animator.StringToHash("fall");
            _playerAnimatorHash.triggerDeath = Animator.StringToHash("death");
        }
    
        // void Start()
        // {
        //     _virtualJoystick.SetDirEvent += MoveDirection;
        //     _virtualJoystick.StopSetDirEvent += StopSetDirEvent;
        // }

        private void OnEnable()
        {
            _virtualJoystick.SetDirEvent += MoveDirection;
            _virtualJoystick.StopSetDirEvent += StopSetDirEvent;
            eventOsContainer.sceneLoadEventSo.SceneLoadRequestEvent += SetPlayerToWait;
            eventOsContainer.sceneLoadEventSo.SceneLoadDoneEvent += SetPlayerToPlay;
        }
        
        private void OnDisable()
        {
            _virtualJoystick.SetDirEvent -= MoveDirection;
            _virtualJoystick.StopSetDirEvent -= StopSetDirEvent;
            eventOsContainer.sceneLoadEventSo.SceneLoadRequestEvent -= SetPlayerToWait;
            eventOsContainer.sceneLoadEventSo.SceneLoadDoneEvent -= SetPlayerToPlay;
        }

        private void Update()
        {
            if (playerState == PlayerState.DEAD || playerState == PlayerState.WAIT)
                return;

            CheckIsGround();

            if (!_isGround)
            {
                //如果不在地面上，死亡倒计时
                if (playerState != PlayerState.DEAD && transform.position.y < deadHight)
                {
                    PlayerDeath();
                }
               
            }
            
        }
    
        #region AudioPlay
        public void FootR()
        {
            //print("FootR");
        }
        public void FootL()
        {
            //print("FootR");
        }
        
        public void Land()
        {
            //print("Land");
        }
        #endregion
        
    
        private void MoveDirection(Vector2 dir)
        {
            if (playerState== PlayerState.DEAD)
                return;
            
            moveDir = dir;
            //依据玩家输入指令幅度 控制游戏速度
            Time.timeScale = moveDir.magnitude;
            _animator.updateMode = AnimatorUpdateMode.Normal;
            SetPlayerState(PlayerState.RUN);
            if (gameManager.gameState != GameState.PLAYING)
            {
                eventOsContainer.gameStartEventSo?.RaiseEvent();
            }
           
        }
    
        private void StopSetDirEvent()
        {
            if (playerState == PlayerState.DEAD)
                return;
      
            moveDir = Vector2.zero;
            if (_isGround )
            { 
                Time.timeScale = 0f;
                _animator.updateMode = AnimatorUpdateMode.UnscaledTime;
                SetPlayerState(PlayerState.IDLE);
            }
            
        }
        
        private void PlayerDeath()
        {
            if (playerState == PlayerState.DEAD)
                return;
            
            
            _animator.SetLayerWeight(1,0);
            Time.timeScale = 1f;
            SetPlayerState(PlayerState.DEAD);
            eventOsContainer.playerDeadEventSo.RaiseEvent();
            GetComponent<Rigidbody>().isKinematic = true;
            
        }


        #region CheckIsGround
        Collider[] hits = new Collider[5];
        [SerializeField]
        private LayerMask groundLayer = 1;
        private void CheckIsGround()
        {
            //脚下射线检测
            int hitCount = Physics.OverlapSphereNonAlloc(transform.position, 0.5f , hits);
            
            bool ground = hitCount > 1;
       
            if (ground !=_isGround)
            {
                _isGround = ground;
                _animator.SetBool(_playerAnimatorHash.boolFall,!_isGround);
                SetPlayerState(_isGround? PlayerState.IDLE : PlayerState.FALL);
                
            }
        }

        private void OnDrawGizmos()
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(transform.position, 0.5f);
        }

        #endregion
        
        private void OnAnimatorMove()
        {
            if (moveDir != Vector2.zero)
            {
                var v3 = new Vector3(moveDir.x, 0, moveDir.y);
                transform.Translate(v3* speed * Time.deltaTime,Space.World);
                
                //优化下面一行代码  
                Quaternion angel = Quaternion.LookRotation(v3);//获取旋转角度
                transform.rotation = Quaternion.Slerp(this.transform.rotation, angel, speed * Time.deltaTime);
            }
        }
        
        public void SetPlayerState(PlayerState playerState)
        {
            if (playerState != PlayerState.NONE && this.playerState != playerState)
            {
                this.playerState = playerState;
            }
           
        }
        
        public void SetPlayerToWait(GameSceneSO gameSceneSO,bool fadeScreen)
        {
            SetPlayerState(PlayerState.WAIT);
        }
        
        public void SetPlayerToPlay(GameSceneSO gameSceneSO)
        {
            SetPlayerState(PlayerState.IDLE);
        }
        
        struct PlayerAnimatorHash
        {
            public int boolMove;
            public int boolFall;
            public int triggerDeath;
    
        }
        
    }
}

