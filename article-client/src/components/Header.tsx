import LoginBtn from "./oauth/LoginBtn";

export default function Header() {
    return (
        <div className="top-0 bg-info w-100 p-2">
            <h1>Article Page</h1>
            <LoginBtn />
        </div>

    )
}