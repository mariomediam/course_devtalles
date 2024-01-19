import type { Metadata } from "next";

export const metadata: Metadata = {
 title: 'About Page',
 description: 'Mi página de about',
 keywords: ['About page', 'Mario Medina'],
};

export default function AboutPage() {
  return (
      <span className="text-7xl">About Page</span>      
    
  );
}
