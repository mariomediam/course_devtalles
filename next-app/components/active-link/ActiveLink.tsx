'use client';

import Link from "next/link";
import { usePathname } from "next/navigation";

import style from "./ActiveLink.module.css";

interface Props {
  href: string;
  label: string;
}

export const ActiveLink = ({ href, label }: Props) => {
    

 const pathName = usePathname();

 
  return (
    <Link href={href} className={`${style.link}  ${pathName == href && style['active-link']}`}>
      {label}
    </Link>
  );
};
