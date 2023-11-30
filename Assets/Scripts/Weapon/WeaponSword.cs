using System;
using DynamicMeshCutter;
using UnityEngine;

namespace Weapon
{
    public class WeaponSword : CutterBehaviour
    {
        
        void OnCreated(Info info, MeshCreationData cData)
        {
            MeshCreation.TranslateCreatedObjects(info, cData.CreatedObjects, cData.CreatedTargets, Separation);
        }
        
        private void OnCollisionEnter(Collision collision)
        {
            MeshTarget target = collision.transform.GetComponentInChildren<MeshTarget>();
            if (target)
            {
                var hitPoint = collision.contacts[0].point;
                var dir = transform.up;
                Cut(target, hitPoint, dir, null, OnCreated);

            }
        }
    }
}