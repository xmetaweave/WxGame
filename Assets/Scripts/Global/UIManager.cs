using System;
using ScritpableObject;
using UI;
using UnityEngine;
using VContainer;

namespace Global
{
    public class UIManager : MonoBehaviour
    {
        [Inject]
        EventOSContainer eventOsContainer;
        
        [SerializeField]
        FinishCanvas finishCanvas;
        
        [SerializeField]
        FadeCanvas fadeCanvas;

        private void OnEnable()
        {
            finishCanvas.Init(eventOsContainer);
            fadeCanvas.Init(eventOsContainer);
            
            finishCanvas.gameObject.SetActive(false);
            
            eventOsContainer.reachTargetEventOS.OnEventRaised += OnReachTarget;
            eventOsContainer.playerDeadEventSo.OnEventRaised += OnPlayerDead;
        }
        
        private void OnDisable()
        {
            eventOsContainer.reachTargetEventOS.OnEventRaised -= OnReachTarget;
            eventOsContainer.playerDeadEventSo.OnEventRaised -= OnPlayerDead;
        }
        
        private void OnReachTarget()
        {
            finishCanvas.gameObject.SetActive(true);
        }
        
        private void OnPlayerDead()
        {
            finishCanvas.gameObject.SetActive(true);
        }
    }
}