using System;
using DynamicMeshCutter;
using UnityEngine;
using System.Collections;
using System.Collections.Generic;

namespace Weapon
{
    public class WeaponSword : CutterBehaviour
    {
        private List<GameObject> translatedObjects = new List<GameObject>();
        private bool canCut = true;
        public float cutCooldown = 0.5f;
        
        void OnCreated(Info info, MeshCreationData cData)
        {
            //MeshCreation.TranslateCreatedObjects(info, cData.CreatedObjects, cData.CreatedTargets, Separation);
            List<GameObject> newlyTranslatedObjects = MeshCreation.TranslateCreatedObjects(info, cData.CreatedObjects, cData.CreatedTargets, Separation);
            translatedObjects.AddRange(newlyTranslatedObjects);
        }
        
        private void OnCollisionEnter(Collision collision)
        {
            if (!canCut)
            {
                return;
            }
            MeshTarget target = collision.transform.GetComponentInChildren<MeshTarget>();
            if (target)
            {
                var hitPoint = collision.contacts[0].point;
                var dir = transform.up;
                if(target && !translatedObjects.Contains(target.gameObject))
                Cut(target, hitPoint, dir, null, OnCreated);
                StartCoroutine(CutCooldown());
            }
        }
        private IEnumerator CutCooldown()
        {
            canCut = false;
            yield return new WaitForSeconds(cutCooldown);
            canCut = true;
        }
    }
}