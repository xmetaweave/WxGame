using System;
using UnityEngine;

namespace DefaultNamespace
{
    public class EnemyBase : MonoBehaviour
    {
        [SerializeField]
        private Collider weaponCollider;

        Animator _animator;

        private void Awake()
        {
            _animator = GetComponent<Animator>();
        }

        private void OnEnable()
        {
            weaponCollider.enabled = false;
        }
        
        public virtual void OnHit()
        {
            Debug.Log("OnHit");
            _animator.enabled = false;
        }

        public virtual void Attack()
        {
            _animator.SetTrigger("Attack");
        }

        public void OnAttackEvent()
        {
            Debug.Log("OnAttackEvent");
            weaponCollider.enabled = true;
        }
        
        public void OnAttackEndEvent()
        {
            Debug.Log("OnAttackEndEvent");
            weaponCollider.enabled = false;
        }
    }
}