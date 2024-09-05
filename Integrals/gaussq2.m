function [d, e, z, ierr] = gaussq2(n, d, e)
% GAUSQ2 finds the eigenvalues and first components of the eigenvectors of a
% symmetric tridiagonal matrix by the implicit QL method.
%
% This subroutine is a translation of an ALGOL procedure from Num. Math.
% by Martin and Wilkinson, as modified by Dubrulle. It is a modified version
% of the 'EISPACK' routine IMTQL2.
%
% Inputs:
%   n - order of the matrix
%   d - diagonal elements of the input matrix
%   e - subdiagonal elements of the input matrix in its first n-1 positions.
%       e(n) is arbitrary.
%
% Outputs:
%   d    - eigenvalues in ascending order. If an error exit is made, the
%          eigenvalues are correct but unordered for indices 1, 2, ..., ierr-1.
%   e    - destroyed
%   z    - first components of the orthonormal eigenvectors of the symmetric
%          tridiagonal matrix. If an error exit is made, z contains the
%          eigenvectors associated with the stored eigenvalues.
%   ierr - 0 for normal return, j if the j-th eigenvalue has not been
%          determined after 30 iterations.

    z = zeros(1, n);
    z(1) = 1;
    ierr = 0;

    if n ~= 1
        e(n) = 0;
        for l = 1:n
            j = 0;
            ivar = 1;
            while ivar == 1
                for m = l:n
                    if m == n || abs(e(m)) <= eps * (abs(d(m)) + abs(d(m+1)))
                        break;
                    end
                end

                p = d(l);
                if m ~= l
                    if j == 30
                        ierr = l;
                        return;
                    end
                    j = j + 1;

                    % Form shift
                    g = (d(l+1) - p) / (2 * e(l));
                    r = sqrt(g^2 + 1);
                    g = d(m) - p + e(l) / (g + sign(g) * r);

                    s = 1;
                    c = 1;
                    p = 0;
                    mml = m - l;

                    for ii = 1:mml
                        i = m - ii;
                        f = s * e(i);
                        b = c * e(i);
                        if abs(f) >= abs(g)
                            c = g / f;
                            r = sqrt(c^2 + 1);
                            e(i+1) = f * r;
                            s = 1 / r;
                            c = c * s;
                        else
                            s = f / g;
                            r = sqrt(s^2 + 1);
                            e(i+1) = g * r;
                            c = 1 / r;
                            s = s * c;
                        end

                        g = d(i+1) - p;
                        r = (d(i) - g) * s + 2 * c * b;
                        p = s * r;
                        d(i+1) = g + p;
                        g = c * r - b;

                        % Form first component of vector
                        f = z(i+1);
                        z(i+1) = s * z(i) + c * f;
                        z(i) = c * z(i) - s * f;
                    end

                    d(l) = d(l) - p;
                    e(l) = g;
                    e(m) = 0;
                else
                    ivar = 2;
                end
            end
        end

        % Order eigenvalues and eigenvectors
        for ii = 2:n
            i = ii - 1;
            k = i;
            p = d(i);

            for j = ii:n
                if d(j) < p
                    k = j;
                    p = d(j);
                end
            end

            if k ~= i
                d(k) = d(i);
                d(i) = p;
                p = z(i);
                z(i) = z(k);
                z(k) = p;
            end
        end
    end
end
