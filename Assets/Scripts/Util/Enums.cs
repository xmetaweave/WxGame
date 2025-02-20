﻿namespace Util
{
    public enum SceneType
    {
        Loadtion,
        Menu
    }
    
    public enum GameState
    {
        PREGAME,
        WAITING,
        PLAYING,
    }
    
    public enum PlayerState
    {
        IDLE,
        RUN,
        DEAD,
        FALL,
        WAIT,
        NONE,
    }
    
    public enum EnemyState
    {
        IDLE,
        RUN,
        ATTACK,
        DEAD,
        NONE,
    }
}