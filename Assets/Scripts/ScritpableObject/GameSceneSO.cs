using UnityEngine;
using UnityEngine.AddressableAssets;
using Util;

namespace ScritpableObject
{
    [CreateAssetMenu(menuName = "Game scene/GameSceneSO", order = 0)]
    public class GameSceneSO : ScriptableObject
    {
        public AssetReference sceneAssetReference;
        public SceneType sceneType;
        public Vector3 startPosition;
    }
}