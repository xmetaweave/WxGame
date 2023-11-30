using UnityEngine;
using UnityEngine.Events;

namespace ScritpableObject
{
    [CreateAssetMenu(menuName = "Event/SceneLoadEventSO")]
    public class SceneLoadEventSO : ScriptableObject
    {
        public UnityAction<GameSceneSO,bool> SceneLoadRequestEvent;
        
        /// <summary>
        /// 场景加载请求
        /// </summary>
        /// <param name="gameSceneSO">要加载的场景</param>
        /// <param name="fadeScreen">是否渐入渐出</param>
        public void RasingSceneLoadRequestEvent(GameSceneSO gameSceneSO,bool fadeScreen = true)
        {
            SceneLoadRequestEvent?.Invoke(gameSceneSO,fadeScreen);
        }
       
    }
}