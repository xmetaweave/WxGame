using System;
using UnityEngine;

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
        private void Awake()
        {
            _animator = GetComponent<Animator>();
            _playerAnimatorHash = new PlayerAnimatorHash();
            _playerAnimatorHash.boolMove = Animator.StringToHash("move");
            _playerAnimatorHash.boolFall = Animator.StringToHash("fall");
            _playerAnimatorHash.triggerDeath = Animator.StringToHash("death");
        }
    
        void Start()
        {
            _virtualJoystick.SetDirEvent += MoveDirection;
            _virtualJoystick.StopSetDirEvent += StopSetDirEvent;
        }
    
        private void Update()
        {
            if (CheckIsGround() !=_isGround)
            {
                _isGround = !_isGround;
                _animator.SetBool(_playerAnimatorHash.boolFall,!_isGround);
            }
            
            
        }
    
        #region footAudioPlay
        public void FootR()
        {
            //print("FootR");
        }
        public void FootL()
        {
            //print("FootR");
        }
        #endregion
        
    
        private void MoveDirection(Vector2 dir)
        {
            moveDir = dir;
            //依据玩家输入指令幅度 控制游戏速度
            Time.timeScale = moveDir.magnitude;
            
            _animator.SetBool(_playerAnimatorHash.boolMove,true);
        }
    
        private void StopSetDirEvent()
        {
            moveDir = Vector2.zero;
            Time.timeScale = 0;
        }


        #region CheckIsGround
        Collider[] hits = new Collider[5];
        [SerializeField]
        private LayerMask groundLayer = 1;
        private bool CheckIsGround()
        {
            //脚下射线检测
            int hitCount = Physics.OverlapSphereNonAlloc(transform.position, 0.5f , hits);
            
            return hitCount > 0;
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
        
        struct PlayerAnimatorHash
        {
            public int boolMove;
            public int boolFall;
            public int triggerDeath;
    
        }
    
       
        
    }
}

