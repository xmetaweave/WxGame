using ScritpableObject;
using UnityEngine;

namespace UI
{
    public class FinishCanvas : MonoBehaviour
    {
        private EventOSContainer eventOsContainer;
        public void Init(EventOSContainer eventOsContainer)
        {
         
        }
        public void OnClickRestart()
        {
            eventOsContainer.sceneLoadEventSo.RasingCurrentSceneLoadEvent();
        }
        
        public void OnClickNext()
        {
            
        }
    }
}