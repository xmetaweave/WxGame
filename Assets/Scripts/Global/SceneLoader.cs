using System;
using System.Collections;
using System.Collections.Generic;
using ScritpableObject;
using UnityEngine;
using UnityEngine.AddressableAssets;
using UnityEngine.SceneManagement;
using Util;

namespace Global
{
    public class SceneLoader : SingletonMono<SceneLoader>
    {
        public SceneLoadEventSO SceneLoadEventSO;
        public GameSceneSO FirstScene;
        public List<GameSceneSO> GamePlayScenes;
        public float fadeDuration = 0.5f;
        
        private GameSceneSO currentLoadScene;
        private GameSceneSO sceneToLoad;
        private bool fadeScreen;
        private int curIndex = -1;

        
        private void Awake()
        {
            OnLoadScene(FirstScene);
        }

        private void OnEnable()
        {
            SceneLoadEventSO.SceneLoadRequestEvent += OnLoadScene;
        }
        
        private void OnDisable()
        {
            SceneLoadEventSO.SceneLoadRequestEvent -= OnLoadScene;
        }
        
        public void OnLoadScene(GameSceneSO gameSceneSO,bool _fadeScreen = true)
        {
            if (gameSceneSO == currentLoadScene)
            {
                Debug.LogWarning($"Trying to load the same scene{gameSceneSO.name}");
            }
            sceneToLoad = gameSceneSO;
            fadeScreen = _fadeScreen;
            StartCoroutine(UnloadPreviousScene());
        }
        
        private IEnumerator UnloadPreviousScene()
        {
            if (fadeScreen)
            {
                //todo:fade screen
            }

            yield return new WaitForSeconds(fadeDuration);
            if (currentLoadScene != null)
            {
                yield return currentLoadScene.sceneAssetReference.UnLoadScene();
            }
            
            LoadNewScene();
        }

        private void LoadNewScene()
        {
            sceneToLoad.sceneAssetReference.LoadSceneAsync(LoadSceneMode.Additive);
            currentLoadScene = sceneToLoad;
        }

        public void LoadToNextScene()
        {
            curIndex++;
            if (curIndex >= GamePlayScenes.Count)
            {
                curIndex = 0;
            }
            OnLoadScene(GamePlayScenes[curIndex]);
        }

    }
}