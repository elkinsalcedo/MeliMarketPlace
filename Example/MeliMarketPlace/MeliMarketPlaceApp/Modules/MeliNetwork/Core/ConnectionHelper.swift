//
//  ConnectionHelper.swift
//
//  Created by Elkin Salcedo on 3/13/21.
//

import Foundation

internal class ConnectionHelper: NSObject
{
    let dataResponse = DataResponse()
    
    internal func sendDataTask(request: URLRequest, onResponse: @escaping(DataResponse) -> Void)
    {
        URLSession.shared.dataTask(with: request)
        { (data, response, error) in
            
            if error != nil
            {
                onResponse(self.dataResponse)
            }
            else
            {
                self.dataResponse.code = (response as? HTTPURLResponse)!.statusCode
                self.dataResponse.data = data!
                onResponse(self.dataResponse)
            }
        }.resume()
    }
    
    internal func createPostRequest(url: URL, header: String, body: Data) -> URLRequest
    {
        var request = URLRequest(url: url)
        request.httpMethod = RemotingConstants.POST
        request.httpBody = body
        request.setValue(header, forHTTPHeaderField: RemotingConstants.ACCEPT_KEY)
        request.setValue(RemotingConstants.CONTENT_TYPE_VALUE, forHTTPHeaderField: RemotingConstants.CONTENT_TYPE_KEY)
        request.setValue(RemotingConstants.CACHE_VALUE, forHTTPHeaderField: RemotingConstants.CACHE_KEY )
        
        return request
    }
    
    internal func validateInputParameters(url: String, header: String) -> Bool
    {
        guard URL(string: url) != nil
        else
        {
            return false
        }
        
        guard header != ""
        else
        {
            return false
        }
        
        return true
    }
}
