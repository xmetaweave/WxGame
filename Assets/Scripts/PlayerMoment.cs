using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class PlayerMoment : MonoBehaviour
{
    public float speed = 5f;
    [SerializeField]
    private VirtualJoystick.VirtualJoystick _virtualJoystick;
    
    Vector2 moveDir = Vector2.zero;
    void Start()
    {
        _virtualJoystick.SetDirEvent += MoveDirection;
        _virtualJoystick.StopSetDirEvent += () => moveDir = Vector2.zero;
    }

    private void Update()
    {
        if (moveDir != Vector2.zero)
        {
            var _vector2 = moveDir * speed * Time.deltaTime;
            transform.Translate(_vector2.x, 0, _vector2.y);
        }
       
    }
    

    public void MoveDirection(Vector2 dir)
    {
        moveDir = dir;
    }
    
}
