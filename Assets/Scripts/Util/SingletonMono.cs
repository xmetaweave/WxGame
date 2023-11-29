using UnityEngine;

namespace Util
{
    public class SingletonMono<T> : MonoBehaviour where T : MonoBehaviour
    {
        private static T instance;

        public static T Instance()
        {
            if (instance == null)
            {
                // var instances = new List<T>(FindObjectsOfType<T>());
                // if (instances.Count > 1)
                //     for (var i = 0; i < instances.Count - 1; i++)
                //         Destroy(instances[i]);
                instance = FindObjectOfType<T>();

                if (instance == null)
                {
                    var obj = new GameObject();
                    obj.name = typeof(T).ToString();
                    instance = obj.AddComponent<T>();
                }
            }

            return instance;
        }
    }
}