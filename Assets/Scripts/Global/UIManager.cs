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
        }
    }
}