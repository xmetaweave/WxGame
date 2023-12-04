using UnityEngine;
using UnityEngine.Events;

namespace ScritpableObject
{
    [CreateAssetMenu(menuName = "Event/VoidEventSO", order = 0)]
    public class VoidEventSO : ScriptableObject
    {
        public UnityAction OnEventRaised;
        
        public void RaiseEvent()
        {
            OnEventRaised?.Invoke();
        }
    }
}