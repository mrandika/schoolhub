<?php

namespace App\Http\Middleware;

use Closure;

class IsKesiswaanAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if ($request->user() && $request->user()->role == 2) {
            return $next($request);
        } else {
            return new Response(view('error/auth/insufficient'));
        }
    }
}
