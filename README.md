# Matlab routines
These are some numerical routines for MATLAB®, it contains hints on how to plot, how to use certain numerical methods with examples tied with commentary. Plot functions in 3D, approximate solutions of nonlinear equations, learn how to build matrices, use them for linear systems and evaluate integrals.


# Algorithms implemented and outline

## Direct Methods for Linear Systems
### Direct Methods for Linear Systems in MATLAB

Direct methods for solving linear systems provide exact solutions within a finite number of operations (assuming no rounding errors). These methods are often favored for their reliability and straightforward implementation when dealing with small to moderately sized matrices. Here, we delve into three core techniques used in MATLAB: QR factorization, LU factorization, and Singular Value Decomposition (SVD), providing formulas and rationale for each.

#### QR Factorization
QR factorization is a technique used to decompose a matrix \( A \) into two components:
\[ A = QR \]
where \( Q \) is an orthogonal matrix (i.e., \( Q^TQ = I \)) and \( R \) is an upper triangular matrix. This factorization is particularly useful for solving linear systems and for computing least squares solutions.

**Formula:**
1. Compute the orthogonal matrix \( Q \) and the upper triangular matrix \( R \) such that the product \( QR \) reproduces the original matrix \( A \).
2. To solve \( Ax = b \), transform the equation using \( Q \) to \( Rx = Q^Tb \), which is easier to solve since \( R \) is triangular.

**Rationale:**
The decomposition simplifies many matrix operations and is numerically stable. In MATLAB, this is often implemented using the `qr` function.

#### LU Factorization
LU factorization breaks a matrix \( A \) into the product of a lower triangular matrix \( L \) and an upper triangular matrix \( U \):
\[ A = LU \]
This method is crucial for systems of equations, matrix inversion, and determinant calculation.

**Formula:**
1. Decompose \( A \) into \( L \) and \( U \) where \( L \) is lower triangular with unit diagonal elements, and \( U \) is upper triangular.
2. To solve \( Ax = b \), first solve \( Ly = b \) for \( y \) using forward substitution, then solve \( Ux = y \) for \( x \) using backward substitution.

**Rationale:**
LU factorization is efficient for systems that require multiple solutions against different right-hand side vectors \( b \). MATLAB's `lu` function handles this decomposition and is optimized for performance.

#### SVD Factorization
Singular Value Decomposition (SVD) provides a way to decompose any matrix \( A \) into three matrices:
\[ A = U\Sigma V^T \]
where \( U \) and \( V \) are orthogonal matrices, and \( \Sigma \) is a diagonal matrix containing the singular values of \( A \).

**Formula:**
1. Identify the orthogonal matrices \( U \) (left singular vectors) and \( V \) (right singular vectors), and the diagonal matrix \( \Sigma \) (singular values).
2. To solve \( Ax = b \), compute \( x = V\Sigma^{-1}U^Tb \), where \( \Sigma^{-1} \) is the reciprocal of the non-zero singular values in \( \Sigma \).

**Rationale:**
SVD is highly robust, providing solutions even for singular or near-singular matrices where other methods fail. It is especially useful in signal processing and statistics. In MATLAB, the `svd` function facilitates this decomposition.

Each of these methods has its particular strengths and is implemented in MATLAB with functions designed to maximize both accuracy and efficiency. Direct methods are typically preferred when the matrix size is not prohibitively large due to their deterministic nature and straightforward application.

## Iterative Methods for Linear Systems
### Iterative Methods for Linear Systems in MATLAB

Iterative methods for solving linear systems are crucial when dealing with large, sparse matrices where direct methods can become computationally expensive or impractical. These methods progressively approximate the solution, ideally converging to the true value as iterations proceed. Let’s explore four widely used iterative techniques: Gauss-Seidel, Jacobi, Gradient Descent, and Conjugate Gradient Descent, detailing their approaches, formulas, and rationale.

#### Gauss-Seidel Method
The Gauss-Seidel method improves the computation speed by using the most recent values of the solution as soon as they are updated.

**Formula:**
For a matrix equation \( Ax = b \), where \( A \) is decomposed into its diagonal (\( D \)), strictly lower triangular (\( L \)), and strictly upper triangular (\( U \)) parts:
\[ x^{(k+1)} = (D + L)^{-1}(b - Ux^{(k)}) \]

**Rationale:**
The method is typically faster than Jacobi, especially for diagonally dominant or symmetric positive definite matrices, because it uses updated values immediately. It is, however, not guaranteed to converge for all matrices.

#### Jacobi Method
The Jacobi method is a straightforward iterative technique that treats every component of the solution vector independently per iteration, making it suitable for parallel computation.

**Formula:**
Using the same decomposition as in Gauss-Seidel:
\[ x^{(k+1)} = D^{-1}(b - (L + U)x^{(k)}) \]

**Rationale:**
It’s simple and can be implemented easily, but it converges slower than Gauss-Seidel. Its main advantage is that it can be applied in parallel computing environments more readily than Gauss-Seidel.

#### Gradient Descent
Gradient Descent minimizes a function by moving in the direction of the steepest descent, updating the solution iteratively based on the gradient of the function at the current point.

**Formula:**
For solving \( Ax = b \) interpreted as minimizing \( f(x) = \frac{1}{2}x^T Ax - b^T x \):
\[ x^{(k+1)} = x^{(k)} - \alpha \nabla f(x^{(k)}) \]
where \( \alpha \) is a step size and \( \nabla f(x) = Ax - b \).

**Rationale:**
Gradient Descent is general and can be used for any function that is differentiable, but it may converge slowly if the function is not well-conditioned. It's widely used in machine learning for fitting models.

#### Conjugate Gradient Descent
The Conjugate Gradient method is an optimization over Gradient Descent, designed specifically for the efficient solution of systems where \( A \) is symmetric and positive definite.

**Formula:**
Starting with an initial guess \( x^{(0)} \), and using \( r^{(0)} = b - Ax^{(0)} \) (the initial residual), and \( p^{(0)} = r^{(0)} \) (initial direction):
\[ \alpha^{(k)} = \frac{{r^{(k)T} r^{(k)}}}{{p^{(k)T} Ap^{(k)}}} \]
\[ x^{(k+1)} = x^{(k)} + \alpha^{(k)} p^{(k)} \]
\[ r^{(k+1)} = r^{(k)} - \alpha^{(k)} Ap^{(k)} \]
\[ \beta^{(k+1)} = \frac{{r^{(k+1)T} r^{(k+1)}}}{{r^{(k)T} r^{(k)}}} \]
\[ p^{(k+1)} = r^{(k+1)} + \beta^{(k+1)} p^{(k)} \]

**Rationale:**
This method reduces the error along successive conjugate directions, ensuring faster convergence compared to the basic Gradient Descent. It is highly effective for large systems where direct methods are too costly.

These iterative methods provide scalable solutions to large-scale systems of linear equations, particularly effective for sparse matrices common in scientific and engineering applications. MATLAB implements these algorithms through built-in functions and toolboxes, allowing users to handle complex and large-dimensional data efficiently.

## Interpolation
### Simple Interpolation
### Splines

## Non-Linear Equations
### Non-Linear Equations in MATLAB

Solving non-linear equations is a fundamental task in numerical analysis, where exact solutions are often unattainable analytically. MATLAB provides tools to tackle these problems using various iterative methods. Each method has its own approach and applicable scenarios. Here's a detailed look at the methods you mentioned: Bisection, Secant, Newton's Method, Fixed Point, and their extensions for systems of non-linear equations.

#### Bisection Method
The Bisection Method is a very reliable technique for finding a root of a function, which works when you know the function values at two points and the function crosses zero between them.

**Formula:**
1. Identify an interval \([a, b]\) where \(f(a)\) and \(f(b)\) have opposite signs.
2. Compute the midpoint \(c = \frac{a + b}{2}\).
3. Determine whether \(f(a)\) and \(f(c)\) have opposite signs. If yes, set \(b = c\); otherwise, set \(a = c\).
4. Repeat until the interval \([a, b]\) is sufficiently small.

**Rationale:**
The method guarantees convergence to a root if the function changes sign over an interval and is continuous. It is simple but can be slow compared to other methods.

#### Secant Method
The Secant Method is an iterative root-finding algorithm that uses two initial approximations to the root and is generally faster than the Bisection method but does not guarantee convergence.

**Formula:**
\[ x_{n+1} = x_n - f(x_n)\frac{x_n - x_{n-1}}{f(x_n) - f(x_{n-1})} \]

**Rationale:**
This method does not require the function to be differentiable, which is an advantage over Newton's method. It converges faster than the Bisection method but may fail if the derivative changes significantly near the root.

#### Newton's Method (aka Newton-Rhapson or Tangent Method)
Newton's Method is highly efficient for finding roots but requires the function to be differentiable. It uses the tangent to the curve at the current guess to find the next guess.

**Formula:**
\[ x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)} \]

**Rationale:**
It offers quadratic convergence when approaching the root, making it one of the fastest root-finding methods. However, its success depends on a good initial guess and the presence of a non-zero derivative at the root.

#### Fixed Point Method
The Fixed Point Iteration involves rewriting the equation \(x = f(x)\) and iteratively substituting the previous value to converge to the root.

**Formula:**
\[ x_{n+1} = g(x_n) \]
where \( g(x) \) is the function reformulated from \( f(x) = 0 \) into \( x = g(x) \).

**Rationale:**
This method is conceptually simple and useful when \( g(x) \) can be derived such that it converges. The convergence rate can be slow, and convergence is only guaranteed under specific conditions, such as \( |g'(x)| < 1 \).

#### For Systems of Non-Linear Equations (Newton and Fixed Point)
These methods can be extended to handle multiple non-linear equations simultaneously.

**Newton's Method for Systems:**
\[ \mathbf{x}_{n+1} = \mathbf{x}_n - J(\mathbf{x}_n)^{-1}F(\mathbf{x}_n) \]
where \( J(\mathbf{x}_n) \) is the Jacobian matrix of partial derivatives, and \( F(\mathbf{x}_n) \) is the vector of function values at \( \mathbf{x}_n \).

**Fixed Point Method for Systems:**
\[ \mathbf{x}_{n+1} = \mathbf{g}(\mathbf{x}_n) \]
where \( \mathbf{g}(\mathbf{x}) \) is a vector function derived from the system \( \mathbf{F}(\mathbf{x}) = \mathbf{0} \) rewritten as \( \mathbf{x} = \mathbf{g}(\mathbf{x}) \).

**Rationale for Systems:**
Newton’s method for systems is very powerful and widely used for its rapid convergence when near a solution. The Fixed Point method for systems is generally less used but can be effective with a good choice of \( \mathbf{g}(\mathbf{x}) \).

Each method's implementation in MATLAB can be done using built-in functions or custom scripts, depending on the specifics of the problem and required accuracy. These methods collectively provide a robust toolkit for addressing non-linear equations in engineering, physics, and other applied sciences.

## Integrals
### Newton-Coates
### Trapezoid
###

## Ordinary Differential Equations
### Implicit Euler Method
### Explicit Euler Method
### Runge Kutta Method
### Heun Method



