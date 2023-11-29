using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

namespace VirtualJoystick
{
    public class VirtualJoystick : MonoBehaviour, IPointerDownHandler, IPointerUpHandler, IDragHandler
    {
        // bgPos, handlePos
        public event Action<Vector2, Vector2> PointerDownEvent;
        public event Action<Vector2> DragEvent;
        public event Action PointerUpEvent;

        public event Action<Vector2> SetDirEvent;
        public event Action StopSetDirEvent;

        [SerializeField, Header("背景图的RectTrans，用于限制实际的操作区域")]
        private RectTransform _bgRectTrans;
        [SerializeField]
        private VirtualJoystickAppearance _virtualJoystickAppearance;
        private Vector2 HandlePos { get { return _virtualJoystickAppearance.HandlePos; } }
        [SerializeField, Header("限制背景图中心点的位置")]
        private int _limitRangeOffset = 0;
        [SerializeField, Header("两点距离多远时，认为停止设置方向")]
        private float _stopSetDirDistance = 10;

        private Vector2 _minPos;
        private Vector2 _maxPos;
        private bool _hasInited = false;

        private Vector2 _bgPos;

        public void OnPointerDown(PointerEventData eventData)
        {
            if (!_hasInited)
            {
                Init();
            }

            Vector2 handlePos = eventData.position;
            //_bgPos = LimitBgPos(eventData.position);
            _bgPos = eventData.position;

            PointerDownEvent?.Invoke(_bgPos, handlePos);
            SetDir(HandlePos, _bgPos);

            void Init()
            {
                int actualLimitRangeOffset = (int)_bgRectTrans.rect.width / 2 + _limitRangeOffset;
                float width = GetComponent<RectTransform>().rect.width;
                float height = GetComponent<RectTransform>().rect.height;

                _minPos = Vector2.one * actualLimitRangeOffset;
                _maxPos = new Vector2(width - actualLimitRangeOffset, height - actualLimitRangeOffset);

                _hasInited = true;
            }

            // Vector2 LimitBgPos(Vector2 pos)
            // {
            //     pos = new Vector2(Mathf.Clamp(pos.x, _minPos.x, _maxPos.x), Mathf.Clamp(pos.y, _minPos.y, _maxPos.y));
            //     return pos;
            // }
        }
        public void OnDrag(PointerEventData eventData)
        {
            DragEvent?.Invoke(eventData.position);
            SetDir(HandlePos, _bgPos);
        }
        public void OnPointerUp(PointerEventData eventData)
        {
            PointerUpEvent?.Invoke();
            StopSetDirEvent?.Invoke();
        }

        private void SetDir(Vector2 handlePos, Vector2 bgPos)
        {
            float distance = Vector2.Distance(handlePos, bgPos);
            if (distance > _stopSetDirDistance)
            {
                Vector2 dir = (handlePos - bgPos)/ _virtualJoystickAppearance._handleAndBgMaxDistance;
                SetDirEvent?.Invoke(dir);

                Debug.Log("SetDir " + dir);
            }
            else
            {
                StopSetDirEvent?.Invoke();
            }
        }
    }
}