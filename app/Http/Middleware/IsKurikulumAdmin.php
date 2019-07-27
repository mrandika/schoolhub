<?php

namespace App\Http\Middleware;

use Illuminate\Http\Response;

use Closure;

class IsKurikulumAdmin
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
        if ($request->user() && $request->user()->role == 3) {
            return $next($request);
        } else {
            return abort(401);
        }
    }
}
