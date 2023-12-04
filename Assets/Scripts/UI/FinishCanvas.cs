using ScritpableObject;
using UnityEngine;
using UnityEngine.UI;

namespace UI
{
    public class FinishCanvas : MonoBehaviour
    {
        private EventOSContainer eventOsContainer;
        [SerializeField]
        private Button _restartButton;
        [SerializeField]
        private Button _nextButton;
        
        public void Init(EventOSContainer eventOsContainer)
        {
         this.eventOsContainer = eventOsContainer;
         _restartButton.onClick.AddListener(OnClickRestart);
            _nextButton.onClick.AddListener(OnClickNext);
        }
        public void OnClickRestart()
        {
            eventOsContainer.sceneLoadEventSo.RasingCurrentSceneLoadEvent();
            gameObject.SetActive(false);
        }
        
        public void OnClickNext()
        {
            eventOsContainer.sceneLoadEventSo.RasingNextSceneLoadEvent();
            gameObject.SetActive(false);
        }
    }
}