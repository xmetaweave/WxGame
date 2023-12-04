using UnityEngine;
using UnityEngine.Events;

namespace ScritpableObject
{
    [CreateAssetMenu(menuName = "Event/SceneLoadEventSO")]
    public class SceneLoadEventSO : ScriptableObject
    {
        public UnityAction<GameSceneSO,bool> SceneLoadRequestEvent;
        public UnityAction<GameSceneSO> SceneLoadDoneEvent;
        public UnityAction CurrentSceneLoadEvent;
        /// <summary>
        /// 场景加载请求
        /// </summary>
        /// <param name="gameSceneSO">要加载的场景</param>
        /// <param name="fadeScreen">是否渐入渐出</param>
        public void RasingSceneLoadRequestEvent(GameSceneSO gameSceneSO,bool fadeScreen = true)
        {
            SceneLoadRequestEvent?.Invoke(gameSceneSO,fadeScreen);
        }
        
        public void RasingSceneLoadDoneEvent(GameSceneSO gameSceneSO)
        {
            SceneLoadDoneEvent?.Invoke(gameSceneSO);
        }
        
        public void RasingCurrentSceneLoadEvent()
        {
            CurrentSceneLoadEvent?.Invoke();
        }
       
        
    }
}