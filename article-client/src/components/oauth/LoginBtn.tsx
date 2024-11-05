import { provider } from "./OAuthCallback"

export default function LoginBtn() {
    const url = `${provider.loginUri}?redirect_uri=${provider.redirectUri}&client_id=${provider.clientId}&scope=${provider.scope}&response_type=code&response_mode=query`

    return (
        <a href={url} className="btn btn-dark">Login</a>
    )
}