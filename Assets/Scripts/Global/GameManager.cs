using System;
using ScritpableObject;
using UnityEngine;
using Util;

namespace Global
{
    public class GameManager : SingletonMono<GameManager>
    {
        public Transform player;
        public EventOSContainer eventOSContainer;
    }
}