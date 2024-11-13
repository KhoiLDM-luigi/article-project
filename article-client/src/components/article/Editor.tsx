import MDEditor from "@uiw/react-md-editor"

export default function Editor(props: any) {
    const { content, setContent } = props
    console.log("Content:")
    console.log(content)

    return (
        <div className="md-editor p-3 h-100">
            <MDEditor 
                value={content} 
                onChange={(value, event, state) => {
                    if (value !== undefined) {
                        setContent((value))
                    }
                }} 
                textareaProps={{
                    placeholder: "Write you content here markdown",
                    minLength: 0
                }}
            />
        </div>
    )
} 