<?php

namespace App\Http\Middleware;

use Illuminate\Http\Response;

use Closure;

class IsKantinAdmin
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
        if ($request->user() && $request->user()->role == 5) {
            return $next($request);
        } else {
            return abort(401);
        }
    }
}
