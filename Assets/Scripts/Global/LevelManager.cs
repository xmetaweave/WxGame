using System;
using UnityEngine;
using Util;
using VContainer;

namespace Global
{
    public class LevelManager : SingletonMono<LevelManager>
    {
        [Inject]
        SceneLoader sceneLoader;
        private void OnGUI()
        {
            if (GUI.Button(new Rect(10, 10, 100, 100), "Load"))
            {
                sceneLoader.LoadToNextScene();
            }
            
        }
    }
}