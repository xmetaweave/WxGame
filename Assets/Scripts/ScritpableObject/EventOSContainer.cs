using UnityEngine;

namespace ScritpableObject
{
    [CreateAssetMenu(menuName = "Event/EventOSContainer",order = 1)]
    public class EventOSContainer : ScriptableObject
    {
        public FadeEventSO fadeEventSo;
        public SceneLoadEventSO sceneLoadEventSo;
        public VoidEventSO gameStartEventSo;
        public VoidEventSO playerDeadEventSo;
        public VoidEventSO ReachTargetEventOS;
    }
}