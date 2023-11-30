using System;
using UnityEngine;
using Util;

namespace Global
{
    public class LevelManager : SingletonMono<LevelManager>
    {
        private void OnGUI()
        {
            if (GUI.Button(new Rect(10, 10, 100, 100), "Load"))
            {
                SceneLoader.Instance().LoadToNextScene();
            }
            
        }
    }
}