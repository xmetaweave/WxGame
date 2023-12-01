using UnityEngine;
using UnityEngine.Events;

namespace ScritpableObject
{
    [CreateAssetMenu(menuName = "Event/FadeEventSO", order = 0)]
    public class FadeEventSO : ScriptableObject
    {
        public UnityAction<Color,float,bool> OnEventRaised;
        public void FadeIn(float duration = 0.5f)
        {
            OnEventRaised?.Invoke(Color.black, duration,true);
        }
        
        public void FadeOut(float duration = 0.5f)
        {
            OnEventRaised?.Invoke(Color.clear, duration,false);
        }
        
        public void RaiseEvent(Color target,float duration,bool fadeIn)
        {
            OnEventRaised?.Invoke(target,duration,fadeIn);
        }
    }
}