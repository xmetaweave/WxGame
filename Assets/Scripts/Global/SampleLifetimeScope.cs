using ScritpableObject;
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

        protected override void Configure(IContainerBuilder builder)
        {
            builder.RegisterInstance(eventOSContainer);
            builder.RegisterComponent(sceneLoader);
        }
    }
}