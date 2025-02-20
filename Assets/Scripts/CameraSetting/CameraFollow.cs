﻿using UnityEngine;

namespace CameraSetting
{
    public class CameraFollow : MonoBehaviour
    {
        public Vector3 offset = new Vector3(0,5,4);//相机相对于玩家的位置
        private Transform target;
        private Vector3 pos;

        public float speed = 2;
        bool isFinished = false;

        // Use this for initialization
        void Start () {
            target = GameObject.FindGameObjectWithTag("Player").transform;

        }

        // Update is called once per frame
        void LateUpdate () {
            if (isFinished)
            {
                transform.RotateAround(target.position, Vector3.up, 60 * Time.deltaTime);
                //transform.position = Vector3.MoveTowards(transform.position, target.position + Vector3.up, 5 * Time.deltaTime);
                return;
            }
            
            pos = target.position + offset;
            this.transform.position = Vector3.Lerp(this.transform.position, pos, speed*Time.deltaTime);//调整相机与玩家之间的距离
            Quaternion angel = Quaternion.LookRotation(target.position - transform.position);//获取旋转角度
            this.transform.rotation = Quaternion.Slerp(this.transform.rotation, angel, speed * Time.deltaTime);
        }
        
        public void ResetCamera()
        {
            this.transform.position = target.position + offset;
            transform.LookAt(target.position);
            isFinished = false;
        }
        
        public void SetFinished(bool isFinished)
        {
            this.isFinished = isFinished;
        }

    }

    
}