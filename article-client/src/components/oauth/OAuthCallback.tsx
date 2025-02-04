import axios from "axios";
import { useEffect } from "react";
import { useLocation, useNavigate } from "react-router-dom";


export const provider = {
    loginUri: "http://127.0.0.1:8081/oauth2/authorize",
    scope: "articles.write profile",
    exchangeAccessTokenUrl: "http://127.0.0.1:8081/oauth2/token",
    clientId: "articles-client",
    clientSecret: "123123123",
    redirectUri: "http://127.0.0.1/login/oauth2/code/spring"
}

export default function OAuthCallback() {
    const location = useLocation();
    const navigate = useNavigate();
  
    const fetchAccessToken = async (code: string) => {
      const { exchangeAccessTokenUrl, redirectUri, clientId, clientSecret } = provider
  
      const data = {
        grant_type: "authorization_code",
        authorize_provider: exchangeAccessTokenUrl,
        code,
        redirect_uri: redirectUri,
        client_id: clientId,
        client_secret: clientSecret,
      };
      
      console.log(data)
      console.log(code)
  
      const response = await axios.post(provider.exchangeAccessTokenUrl, data, {
          headers: {
            "Content-Type":  "application/x-www-form-urlencoded"
          },
          withCredentials: true
      });
  
      const { access_token } = response.data;
      return access_token;
    };
  
    useEffect(() => {
      const params = new URLSearchParams(location.search);
      const code = params.get("code");
      if (code) {
        // Exchange the authorization code for an access token
        fetchAccessToken(code).then((token) => {
          localStorage.setItem("access_token", token)
          console.log(token);
          navigate("/");
        })
        .catch((e) => {
          console.log(e)
          return (
            <div><p className="text-danger">Something when wrong</p></div>
          )
        });
      }
    }, []);
  
    return <div>We are working on it</div>;
  }