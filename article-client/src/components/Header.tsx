import Account from "./account/Account";
import LoginBtn from "./oauth/LoginBtn";

export default function Header() {
    return (
        <div className="bg-secondary top-0 w-100 p-2">
            <h1>Article Page</h1>
            <Account />
        </div>

    )
}