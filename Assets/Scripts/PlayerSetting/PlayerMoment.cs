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
    
        private void OnAnimatorMove()
        {
            if (moveDir != Vector2.zero)
            {
                var v3 = new Vector3(moveDir.x, 0, moveDir.y);
                transform.position += v3 * speed * Time.deltaTime;
                
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

