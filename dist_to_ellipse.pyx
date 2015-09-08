#This was a python module of another code where I needed to calculate the distance of an array of points from the ellipse
#The number of elements in an array were almost 200 and the cython speed up was almost equal to 3

def dist_pts_ellipse(((ex,ey),(dx,dy),angle),points):
    """
    return unsigned euclidian distances of points to ellipse
    """
    pts = np.float64(points)
    rx,ry = dx*0.5, dy*0.5
    angle=np.deg2rad(angle)pts = pts - np.array((ex,ey)) 
    pts /= np.array((rx,ry)) 
    norm_mag = np.sqrt((pts*pts).sum(axis=1))
    norm_dist = abs(norm_mag-1)
    ratio = (norm_dist)/norm_mag 
    scaled_error = np.transpose(pts.T*ratio) r
    real_error = scaled_error*np.array((rx,ry))
    error_mag = np.sqrt((real_error*real_error).sum(axis=1))
    return error_mag
