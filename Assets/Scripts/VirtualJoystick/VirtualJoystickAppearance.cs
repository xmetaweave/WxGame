using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace VirtualJoystick
{
    public class VirtualJoystickAppearance : MonoBehaviour
    {
        [SerializeField]
        private VirtualJoystick _virtualJoystick;
        [SerializeField]
        private RectTransform _bgRectTrans;
        public Vector2 BgPos{ get { return _bgRectTrans.position; } }
        [SerializeField]
        private RectTransform _handleRectTrans;
        public Vector2 HandlePos
        { 
            get { return _handleRectTrans.position; }
        }
        [SerializeField]
        private CanvasGroup _canvasGroup;
        [SerializeField, Range(0, 1)]
        private float _hideAlpha = 0.2f;
        private Vector2 _bgDefaultPos;
        [SerializeField]
        public float _handleAndBgMaxDistance = 120;
        void Start()
        {
            Init();
        }

        private void OnDestroy() 
        {
            Destroy();
        }

        void Init()
        {
            var joystickRect = transform.GetComponent<RectTransform>().rect;
            _bgDefaultPos = new Vector2(joystickRect.width / 2, joystickRect.height/2);

            Hide();
            ResetPos();

            _virtualJoystick.PointerDownEvent += OnPointerDown;
            _virtualJoystick.SetDirEvent += OnSetDir;
            _virtualJoystick.StopSetDirEvent += OnStopSetDir;
            _virtualJoystick.DragEvent += OnDrag;
            _virtualJoystick.PointerUpEvent += OnPointerUp;
        }

        void Destroy()
        {
            if (_virtualJoystick != null)
            {
                _virtualJoystick.PointerDownEvent -= OnPointerDown;
                _virtualJoystick.SetDirEvent -= OnSetDir;
                _virtualJoystick.StopSetDirEvent -= OnStopSetDir;
                _virtualJoystick.DragEvent -= OnDrag;
                _virtualJoystick.PointerUpEvent -= OnPointerUp;
            }
        }

        private void Hide()
        {
            _canvasGroup.alpha = _hideAlpha;
        }
        private void Show()
        {
            _canvasGroup.alpha = 1;
        }

        private void ResetPos()
        {
            _bgRectTrans.transform.position = _bgDefaultPos;
            _handleRectTrans.localPosition = Vector3.zero;
        }

        private void LimitHandlePos(Vector2 pos)
        {
            if (Vector2.Distance(pos, (Vector2)_bgRectTrans.transform.position) > _handleAndBgMaxDistance)
            {
                pos = (Vector2)_bgRectTrans.transform.position + (pos - (Vector2)_bgRectTrans.transform.position).normalized * _handleAndBgMaxDistance;
            }

            _handleRectTrans.position = pos;
        }


        #region 关注joystick的一些事件
        private void OnPointerDown(Vector2 bgPos, Vector2 handlePos)
        {
            _bgRectTrans.position = bgPos;
            LimitHandlePos(handlePos);

            Show();
        }

        private void OnSetDir(Vector2 dir)
        {
            if (IsInHide())
            {
                Show();
            }

            bool IsInHide()
            {
                return _canvasGroup.alpha == _hideAlpha;
            }
        }

        private void OnStopSetDir()
        {
            // Hide();
            // ResetPos();
        }

        private void OnDrag(Vector2 handlePos)
        {
            LimitHandlePos(handlePos);
        }

        private void OnPointerUp()
        {
            Hide();
            ResetPos();
        }
        #endregion
    }
}