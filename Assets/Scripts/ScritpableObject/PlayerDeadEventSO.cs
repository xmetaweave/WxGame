using UnityEngine;
using UnityEngine.Events;

namespace ScritpableObject
{
    [CreateAssetMenu(fileName = "PlayerDeadEventSO", menuName = "Event/PlayerDeadEventSO", order = 0)]
    public class PlayerDeadEventSO : ScriptableObject
    {
        public UnityAction OnEventRaised;
        
        public void RaiseEvent()
        {
            OnEventRaised?.Invoke();
        }
    }
}