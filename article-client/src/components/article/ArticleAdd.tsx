import { useState } from "react";
import Editor from "./Editor";
import { Button } from "react-bootstrap";
import axios from "axios";
import { useNavigate } from "react-router-dom";

export default function ArticleAdd() {
    const navigate = useNavigate()
    if (!localStorage) {
      navigate("/")
    }
    let token = localStorage.getItem("access_token")
    if (token === null) {
        navigate("/")
    }

    const [ title, setTitle ] = useState("")
    const [ content, setContent ] = useState("");

    const syncResource = async () => {
        try {
          await axios.post('http://127.0.0.1:8082/articles/', {
            content,
            title
          }, {
            headers: {
              "Content-Type": "application/json",
              "Authorization": `Bearer ${token}`
            }
          })
          navigate(`/articles`)
        }
        catch(e) {
          console.log(e)
        }
    }

    return (
        <div className="container pt-5">
            <label>Title: <input value={title} onChange={(e) => setTitle(e.target.value)} /></label>
            <Editor content={content} setContent={setContent} />
            <Button onClick={() => {
                syncResource()
            }}>Submit</Button>
        </div>
    )
}