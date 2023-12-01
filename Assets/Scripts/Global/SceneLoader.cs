using System;
using System.Collections;
using System.Collections.Generic;
using ScritpableObject;
using UnityEngine;
using UnityEngine.AddressableAssets;
using UnityEngine.ResourceManagement.AsyncOperations;
using UnityEngine.ResourceManagement.ResourceProviders;
using UnityEngine.SceneManagement;
using Util;
using VContainer;

namespace Global
{
    public class SceneLoader : MonoBehaviour
    {
        public GameSceneSO FirstScene;
        public List<GameSceneSO> GamePlayScenes;
        public float fadeDuration = 0.5f;
        
        private GameSceneSO currentLoadScene;
        private GameSceneSO sceneToLoad;
        private bool fadeScreen;
        private int curIndex = -1;
        private bool isLoading = false; //是否正在加载中
        [Inject]
        EventOSContainer eventOSContainer;
        private void Awake()
        {
            OnLoadScene(FirstScene);
        }
        
        private void OnEnable()
        {
            eventOSContainer.sceneLoadEventSo.SceneLoadRequestEvent += OnLoadScene;
        }
        
        private void OnDisable()
        {
            eventOSContainer.sceneLoadEventSo.SceneLoadRequestEvent -= OnLoadScene;
        }
        
        public void OnLoadScene(GameSceneSO gameSceneSO,bool _fadeScreen = true)
        {
            if (isLoading)
            {
                Debug.LogWarning($"Trying to load scene{gameSceneSO.name} while another scene is loading");
                return;
            }
            if (gameSceneSO == currentLoadScene)
            {
                Debug.LogWarning($"Trying to load the same scene{gameSceneSO.name}");
                return;
            }
            isLoading = true;
            sceneToLoad = gameSceneSO;
            fadeScreen = _fadeScreen;
            if (currentLoadScene != null)
            {
                StartCoroutine(UnloadPreviousScene());
            }
            else
            {
                LoadNewScene();
            }
            
        }
        
        private IEnumerator UnloadPreviousScene()
        {
            if (fadeScreen)
            {
                eventOSContainer.fadeEventSo.FadeIn(fadeDuration);
            }
        
            yield return new WaitForSeconds(fadeDuration);
          
            yield return currentLoadScene.sceneAssetReference.UnLoadScene();
            
            GameManager.Instance().player.gameObject.SetActive(false);
            LoadNewScene();
        }
        
        private void LoadNewScene()
        {
            sceneToLoad.sceneAssetReference.LoadSceneAsync(LoadSceneMode.Additive).Completed += OnLoadDone;
            
        }
        
        private void OnLoadDone(AsyncOperationHandle<SceneInstance> obj)
        {
            if (obj.Status == AsyncOperationStatus.Succeeded)
            {
                currentLoadScene = sceneToLoad;
                GameManager.Instance().player.position = currentLoadScene.startPosition;
                GameManager.Instance().player.gameObject.SetActive(true);
                if (fadeScreen)
                {
                    GameManager.Instance().eventOSContainer.fadeEventSo.FadeOut(fadeDuration);
                }
                isLoading = false;
        
                SceneManager.SetActiveScene(obj.Result.Scene);
            }
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