//
//  NetworkController.swift
//
//  Created by Elkin Salcedo on 3/13/21.
//

import Foundation

@objcMembers
public class NetworkController: NSObject, NetworkControllerProtocol
{
    let helper = ConnectionHelper()

    public func getRequest(urlString: String, header: String, onResponse: @escaping(DataResponse) -> Void)
    {
        guard helper.validateInputParameters(url: urlString, header: header)
        else
        {
            onResponse(DataResponse())
            
            return
        }
        
        let url = URL(string: urlString)
        helper.sendDataTask(request: URLRequest(url: url!), onResponse:
        { (dataResponse) in
            onResponse(dataResponse)
        })
    }
    
    public func postRequest(urlString: String, header: String, body: Data, onResponse: @escaping(DataResponse) -> Void)
    {
        guard helper.validateInputParameters(url: urlString, header: header)
        else
        {
            onResponse(DataResponse())
            
            return
        }
        
        helper.sendDataTask(request: helper.createPostRequest(url: URL(string: urlString)!, header: header, body: body), onResponse:
        { (dataResponse) in
            onResponse(dataResponse)
        })
    }
}
