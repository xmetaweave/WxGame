using System.Net.Mime;
using DG.Tweening;
using ScritpableObject;
using UnityEngine;
using UnityEngine.UI;
using VContainer;

namespace UI
{
    public class FadeCanvas : MonoBehaviour
    {
        public Image fadeImage;
        
        EventOSContainer eventOsContainer;
        private void OnEnable()
        {
           // eventOsContainer.fadeEventSo.OnEventRaised += Fade;
            fadeImage.gameObject.SetActive(false); 
        }

        private void OnDisable()
        {
            //eventOsContainer.fadeEventSo.OnEventRaised -= Fade;
        }

        public void Fade(Color target,float duration,bool fadeIn)
        {
            fadeImage.gameObject.SetActive(true); 
            print("Fade" + target+ fadeIn);
            fadeImage.DOBlendableColor(target, duration).onComplete += () =>
            {
                if (!fadeIn)
                {
                    fadeImage.gameObject.SetActive(false);
                }
            };
        }


        public void Init(EventOSContainer eventOsContainer1)
        {
          this.eventOsContainer = eventOsContainer1;
          eventOsContainer.fadeEventSo.OnEventRaised += Fade;
          fadeImage.gameObject.SetActive(false);
        }
    }
}