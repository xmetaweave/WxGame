using System;
using CameraSetting;
using PlayerSetting;
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
            eventOSContainer.reachTargetEventOS.OnEventRaised += OnReachTarget;
            
        }
        
        private void OnDisable()
        {
            eventOSContainer.sceneLoadEventSo.SceneLoadDoneEvent -= OnSceneLoadDone;
            eventOSContainer.gameStartEventSo.OnEventRaised -= OnGameStart;
            eventOSContainer.reachTargetEventOS.OnEventRaised -= OnReachTarget;
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
            Transform startPoint = GameObject.FindWithTag("Respawn").transform;
            player.position = startPoint.position;
            player.rotation = startPoint.rotation;
            player.gameObject.SetActive(true);

            mainCamera.GetComponent<PostProcessHeightFog1>().material = currentLoadScene.fogMaterial;
            mainCamera.GetComponent<CameraFollow>().ResetCamera();
        }
        
        private void OnReachTarget()
        {
            mainCamera.GetComponent<CameraFollow>().SetFinished(true);
            player.GetComponent<PlayerMoment>().SetPlayerState(PlayerState.WAIT);
            Time.timeScale = 1;
        }
        
    }
}