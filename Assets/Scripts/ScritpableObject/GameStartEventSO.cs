using UnityEngine;
using UnityEngine.Events;

namespace ScritpableObject
{
    [CreateAssetMenu(menuName = "Event/GameStartEventSO", order = 0)]
    public class GameStartEventSO : ScriptableObject
    {
        public UnityAction OnEventRaised;
        
        public void RaiseEvent()
        {
            OnEventRaised?.Invoke();
        }
    }
}