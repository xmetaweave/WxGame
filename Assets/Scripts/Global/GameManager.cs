using System;
using CameraSetting;
using PostProcess;
using ScritpableObject;
using UnityEngine;
using Util;
using VContainer;

namespace Global
{
    public class GameManager : MonoBehaviour
    {
        public Transform player;
        public Camera mainCamera;
        [Inject]
        private EventOSContainer eventOSContainer;

        public GameState gameState { get; private set; }

        private void Awake()
        {
            if (mainCamera == null)
            {
                mainCamera = Camera.main;
            }
        }

        private void OnEnable()
        {
            eventOSContainer.sceneLoadEventSo.SceneLoadDoneEvent += OnSceneLoadDone;
            eventOSContainer.gameStartEventSo.OnEventRaised += OnGameStart;
            
              
        }
        
        private void OnDisable()
        {
            eventOSContainer.sceneLoadEventSo.SceneLoadDoneEvent -= OnSceneLoadDone;
            eventOSContainer.gameStartEventSo.OnEventRaised -= OnGameStart;
        }

        private void Update()
        {
 
        }

        private void OnGameStart()
        {
            SetGameState(GameState.PLAYING);
            
        }
        
        public void SetGameState(GameState gameState)
        {
            this.gameState = gameState;
        }

        private void OnSceneLoadDone(GameSceneSO currentLoadScene)
        {
            player.position = currentLoadScene.startPosition;
            player.rotation = Quaternion.Euler(currentLoadScene.startRotation);
            player.gameObject.SetActive(true);

            mainCamera.GetComponent<PostProcessHeightFog1>().material = currentLoadScene.fogMaterial;
            mainCamera.GetComponent<CameraFollow>().QuicklyMoveToTarget();
        }
        
        
       
    }
}