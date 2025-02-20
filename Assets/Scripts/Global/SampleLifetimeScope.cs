﻿using ScritpableObject;
using UI;
using UnityEngine;
using VContainer;
using VContainer.Unity;

namespace Global
{
    public class SampleLifetimeScope: LifetimeScope
    {
        [SerializeField]
        private EventOSContainer eventOSContainer;
        [SerializeField]
        private SceneLoader sceneLoader;
        [SerializeField]
        private GameManager gameManager;

        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterInstance(eventOSContainer);
            builder.RegisterComponent(sceneLoader);
            builder.RegisterComponent(gameManager);
        }
    }
}