using System;
using ScritpableObject;
using UnityEngine;
using VContainer;

namespace PlayerSetting
{
    public class PlayerController : MonoBehaviour
    {
        private Animator _animator;

        [Inject]
        EventOSContainer eventOsContainer;
        private void Awake()
        {
            _animator = GetComponent<Animator>();
        }

        private void OnTriggerEnter(Collider other)
        {
            if (other.CompareTag("FinalTarget"))
            {
                _animator.SetTrigger("Win");
                eventOsContainer.reachTargetEventOS.RaiseEvent();
                
            }
        }

      
    }
}