import { useEffect, useState } from "react";
import Editor from './Editor';
import { useNavigate, useParams } from 'react-router-dom';
import axios from 'axios';
import { Button } from 'react-bootstrap';
import { Spinner } from 'react-bootstrap';

export default function ArticleEdit() {
    const navigate = useNavigate()
    if (!localStorage) {
      navigate("/")
    }
    let token = localStorage.getItem("access_token")
    if (token === null) {
        navigate("/")
    }

    const { id } = useParams()


    const [ data, setData] = useState({title: "", by: "", content: ""});
    const [ loading, setLoading ] = useState(true)
    const [ error, setError ] = useState(false)

    const fetchResource = async (id: any) => {
        try{
            const response = await axios.get(`http://127.0.0.1:8082/articles/${id}`)   
            setData(response.data)
            setLoading(false)
        }
        catch(e) {
            console.log(e)
            setError(true)
        }
    }

    const syncResource = async () => {
        try {
            await axios.put(`http://127.0.0.1:8082/articles/${id}`, {
                content: data.content,
                title: data.title
            }, {
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${token}`
            }
            })
            navigate(`/articles/view/${id}`)
        }
        catch(e) {
            console.log(e)
        }
    }
    
    const setContent = (value: string) => {
        let nData = { 
            title: data.title,
            by: data.by, 
            content: value
        }
        setData(nData)
    }

    useEffect(() => { fetchResource(id) }, [])

    if (error) {
      return (
          <div><p className="text-danger">Something when wrong</p></div>
      )
    }

    return (
      <div className="container pt-5">
        { loading ? <Spinner animation="border" variant="dark" /> :
          <div>
            <label>
              Title:  
              <input 
                value={data.title} 
                onChange={(e) => { 
                  let nData = { 
                    title: e.target.value, 
                    by: data.by, 
                    content: data.content 
                  }
                  setData(nData)
                }} 
              />
            </label>
            <Editor content={data.content} setContent={setContent} />
            <Button onClick={() => {
                console.log(data)
                syncResource()
            }}>Submit</Button>
          </div>
        }
      </div>
    )
}