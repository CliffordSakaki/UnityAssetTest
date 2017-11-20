using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class scrAutoRotate : MonoBehaviour
{

    // Use this for initialization
    void Start()
    {
		
    }
	
    // Update is called once per frame
    void Update()
    {
        Quaternion rot = gameObject.transform.rotation;
        Vector3 rotEuler = new Vector3 (0.0f, 1.0f, 0.0f);
        rot *= Quaternion.Euler (rotEuler);
        gameObject.transform.rotation = rot;
    }
}
