using UnityEngine;

namespace ScritpableObject
{
    [CreateAssetMenu(menuName = "Event/EventOSContainer",order = 1)]
    public class EventOSContainer : ScriptableObject
    {
        public FadeEventSO fadeEventSo;
        public SceneLoadEventSO sceneLoadEventSo;
        public GameStartEventSO gameStartEventSo;
        public PlayerDeadEventSO playerDeadEventSo;
    }
}