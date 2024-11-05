import axios from "axios"
import LoginBtn from "../oauth/LoginBtn"
import { useEffect, useState } from "react"
import Spinner from "react-bootstrap/esm/Spinner"
import { Button } from "react-bootstrap"
import { useNavigate } from "react-router-dom"

export default function Account() {
    if (!localStorage) {
        return (
            <div>
                <LoginBtn />
            </div>
        )
    }
    let token = localStorage.getItem("access_token")
    if (token === null) {
        return (
            <div>
                <LoginBtn />
            </div>
        )
    }

    const [user, setUser] = useState({username: "guest", role: "user"})
    const [login, setLogin] = useState(false)
    const [error, setError] = useState(false)
    const navigate = useNavigate();

    const fetchUserResource = async () => {
        try {
            const response = await axios.get("http://127.0.0.1:8081/users/profile", {
                headers: {
                    "Authorization": `Bearer ${token}`
                }
            })
            setUser({username: response.data.username, role: response.data.role})
            setLogin(true)
        }
        catch(e) {
            console.log(e)
            setError(true)
            
        }
    }

    const handleLogout = () => {
        localStorage.removeItem("access_token")
        setLogin(false)
        navigate("/");
    }

    useEffect(() => {
        fetchUserResource()
    }, [])

    if (error) {
        return (
            <div>
                <p className="text-warning">Something when wrong...</p>
                <LoginBtn />
            </div>
        )
    }

    return (
        <div>
            {login ? 
                <div>
                    <p>Hello <span className="text-info">{user.username}</span></p> 
                    <Button onClick={() => handleLogout()}>Logout</Button>
                </div>
                :
                 <Spinner animation="border" variant="dark" />
            }
        </div>
       
    )

    
}