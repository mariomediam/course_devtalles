import { HomeIcon } from "@primer/octicons-react";
import Link from "next/link";
import { ActiveLink } from "..";

export const Navbar = () => {
  const navItems = [
    { href: "/about", label: "About" },
    { href: "/pricing", label: "Pricing" },
    { href: "/contact", label: "Contact" },
  ];

  return (
    <nav className="flex bg-blue-800 bg-opacity-30 p-2 m-2 rounded">
      <Link className="flex items-center" href={"/"}>
        <HomeIcon className="mr-1" />
        <span>Home</span>
      </Link>

      <div className="flex flex-1"></div>

      {navItems.map(({ href, label }) => (
        <ActiveLink key={href} href={href} label={label} />
      ))}
    </nav>
  );
};
