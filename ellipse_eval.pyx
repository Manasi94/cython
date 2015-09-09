import cv2
import numpy as np
cimport numpy as np
from methods import dist_pts_ellipse

def ellipse_eval(contours,self):
  c = np.concatenate(contours)
  e = cv2.fitEllipse(c)
  d = dist_pts_ellipse(e,c)
  fit_variance = np.sum(d**2)/float(d.shape[0])
  return fit_variance <= self.inital_ellipse_fit_threshhold
